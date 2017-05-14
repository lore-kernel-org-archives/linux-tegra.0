From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/tegra: Correct idr_alloc() minimum id
Date: Sun, 14 May 2017 22:47:41 +0300
Message-ID: <3af96cfb-370a-1963-b800-65c86f040a12@gmail.com>
References: <20170512190044.17541-1-digetx@gmail.com>
 <20170512190044.17541-2-digetx@gmail.com>
 <b30acd8a-db8c-f43c-7c40-0064444466a0@kapsi.fi>
 <b61d6877-cbfc-9b14-93d2-cf6432452fd8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b61d6877-cbfc-9b14-93d2-cf6432452fd8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.05.2017 16:02, Dmitry Osipenko wrote:
> On 14.05.2017 14:53, Mikko Perttunen wrote:
>> On 05/12/2017 10:00 PM, Dmitry Osipenko wrote:
>>> The start = 0 is invalid and causes weird CDMA channel timeouts, presumably
>>> some memory misuse/corruption is going on.
>>
>> What makes you think start = 0 is invalid? I can't see anything pointing to that
>> in the idr code and there are many users in the kernel passing 0 as start.
>>
> 
> Well, I can't see either. You are right that there are quite many others with 0
> as a start, the 1 probably just masks the bug.
> 

Finally, I found the root of the issue. The job->client is set to the context ID
in the tegra_drm_submit() and the host1x_cdma sets client ID to 0 to mark CDMA
job timeout timer as already armed. I'll send V2 with a new commit description.

-- 
Dmitry
