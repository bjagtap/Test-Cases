Summary: Merck

To check correct wave_id and tactcic id for cmapaignids for NBE and Merck feeds records.

select a.*,a.VariableID1 as Wave_Id, b.name as tactic_ID
	from dwcampaignperformance.ct.deploymentlist a 
	join dwrx.ctp.segment b on b.segmentID = a.segmentID
	where list_ID in 
	(
		select list_ID
		from DWFeed.dbo.MerckNBEDeploymentListLog a
		where createdttm >= '8/3/2020' and createdttm <= '8/5/2020'
	)

===================================


Requirement: Here basically campaign ids are different because broadcast name is same, but sources are different like ‘NBE’ and ‘Organic’ tactic id would be same just campaign id would be different.
DWFeed.dbo.stage_KeytrudaMelanoma_Organic_MasterData
DWFeed.dbo.stage_KeytrudaMelanoma_NBE_MasterData


--check is botclick logic chnage top quiery table name.

Select *
from DWMedProStaging.merck.tbstageresponse(nolock) n where startdate='20200801' and enddate='20200515' 
and Druglistmatchkey='5281' and
 n.MasterUserid in (
 Select distinct a.MasterUserID from newsletterarchivepro.nl.activity (nolock) a,newsletterarchivepro.nl.driver (nolock) b
 where a.isbotclicked= 1 and convert(varchar(10),a.CreateDTTM  ,112)>='20200801' and
 convert(varchar(10),a.CreateDTTM  ,112)<='20200515'
 --and b.BroadCastID = '41925840'
 )



--to check alt_job_id abd campaign is same
 Select Cmpgn_ID,alt_job_id, vndr_job_id, Broadcastname,Tactic_ID,Usr_Actn_CD, Count(*) Counts
from DWMedProStaging.merck.tbstageresponse(nolock)
 where startdate='20200801' and enddate='20200815' and Druglistmatchkey='5281'
 group by Cmpgn_ID,alt_job_id, vndr_job_id, Broadcastname,Usr_Actn_CD,Tactic_ID

 --Provide below screenshot for zira  Summary:

  Select factopportunityname, Channel, prod_id,wave_id,Sub_Channel,Usr_Actn_CD,Count(*) Counts 
from DWMedProStaging.merck.tbstageresponse(nolock) where startdate='20200801' 
and enddate='20200815' and Druglistmatchkey='5281'
group by factopportunityname,Usr_Actn_CD, Channel, prod_id,wave_id,Sub_Channel


 Select vndr_job_id, Broadcastname,Tactic_ID,Usr_Actn_CD, Count(*) Counts
from DWMedProStaging.merck.tbstageresponse(nolock)
 where startdate='20200801' and enddate='20200815' and Druglistmatchkey='5281'
 group by vndr_job_id, Broadcastname,Usr_Actn_CD,Tactic_ID

 
 