
--PLD 
--check is botclick logic chnage top quiery table name.

Select *
from DWMedProStaging.merck.tbstageresponse(nolock) n where startdate='20200501' and enddate='20200515' and Druglistmatchkey='4772' and
 n.MasterUserid in (
 Select distinct a.MasterUserID from newsletterarchivepro.nl.activity (nolock) a,newsletterarchivepro.nl.driver (nolock) b
 where a.isbotclicked= 1 and convert(varchar(10),a.CreateDTTM  ,112)>='20200501' and
 convert(varchar(10),a.CreateDTTM  ,112)<='20200515'
 --and b.BroadCastID = '41925840'
 )

--Records Count

Select COunt(*) Counts
from dwmedprostaging.cmi.tbPLDResponse(nolock) b where b.contract# ='10415960074' and b.startdatekey='20200301' and b.enddatekey= '20200315'
and CMI_PlacementID='140946'

--CMI Field verification 

Select distinct Brand_Name,CMI_PlacementID,producttype,supplier, vehicle_name, TargetListID,Placement_Description,buy_component_type,
campaign_name, campaign_type
from dwmedprostaging.cmi.tbPLDResponse(nolock) b where b.contract# ='10415960074' and b.startdatekey='20200301' and b.enddatekey= '20200315'
and CMI_PlacementID='140946'

--Reach & Visits Counts
Select
Producttype,
CMI_PlacementID,
Campaign_Type,
Brand_Name,
Campaign_Name,
Custom_10,
Client_PlacementID,
ME_ID,
[Metric-CMI label],
count(*)Counts
from dwmedprostaging.cmi.tbPLDResponse(nolock) b  where b.contract# ='10415960074' and b.startdatekey='20200301' and b.enddatekey= '20200315'
and CMI_PlacementID='140946'
group by Producttype,CMI_PlacementID,Campaign_Type,Brand_Name,Campaign_Name,Custom_10,Client_PlacementID,ME_ID,[Metric-CMI label]
order by Producttype


Select 
Producttype,
CMI_PlacementID,
Client_PlacementID,
Campaign_Type,
Creative_Message,
custom_10,
custom_5,
[Metric-CMI label],
broadcastName,
Count(*) Counts
from dwmedprostaging.cmi.tbPLDResponse(nolock) b   where b.contract# ='10415960074' and b.startdatekey='20200301' and b.enddatekey= '20200315'
and CMI_PlacementID='140946'
group by Producttype,CMI_PlacementID,Client_PlacementID,Campaign_Type,Creative_Message,custom_10,custom_5,[Metric-CMI label],broadcastName
order by broadcastName


--Aggregate 

--Reach Metric Count
select b.[Metric-CMI label],Producttype,Count(*)Counts from dwmedprostaging.cmi.tbPLDResponse(nolock) b where b.contract# ='10415960074' 
and b.startdatekey='20200301' and b.enddatekey= '20200315'and CMI_PlacementID='140946'
and b.[Metric-CMI label] in ('Reach','Visits')
group by b.[Metric-CMI label],Producttype

--IMP

Select distinct Month,supplier, factopportunityname,Brand,vehicle,placement_name, Target_list_segment, creative_message, reach,visits
 from dwmedprostaging.cmi.tbAggregateActivity(nolock) b    where b.contract# ='10415960074' and b.startdatekey='20200301' and b.enddatekey= '20200315'
and CMI_PlacementID='140946'

--
Select 
sum(cast(Reach as int))Reach,
sum(cast(visits as int))Visits
,brand,
ProductType
from dwmedprostaging.cmi.tbAggregateActivity(nolock) c 
where c.contract# ='10415960074' and c.startdatekey='20200301' and c.enddatekey= '20200315'and CMI_PlacementID='140946'
group by brand,ProductType
