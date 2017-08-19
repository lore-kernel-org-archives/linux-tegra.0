From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] gpu: host1x: Enable gather filter
Date: Sat, 19 Aug 2017 15:05:57 +0300
Message-ID: <6298c86c-1fb5-c9dc-f8d4-92af5c5820be@gmail.com>
References: <20170818161553.27597-1-mperttunen@nvidia.com>
 <20170818161553.27597-3-mperttunen@nvidia.com>
 <ae084d08-89d0-ced0-c040-78500aa8e5d5@gmail.com>
 <64de3b3b-7c9e-54e9-49f4-d89b3d2c5f21@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64de3b3b-7c9e-54e9-49f4-d89b3d2c5f21-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 19.08.2017 13:46, Mikko Perttunen wrote:
> On 08/19/2017 01:42 PM, Dmitry Osipenko wrote:
>> On 18.08.2017 19:15, Mikko Perttunen wrote:
>>> The gather filter is a feature present on Tegra124 and newer where the
>>> hardware prevents GATHERed command buffers from executing commands
>>> normally reserved for the CDMA pushbuffer which is maintained by the
>>> kernel driver.
>>>
>>> This commit enables the gather filter on all supporting hardware.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>
>> TRM says that "Invalid Gbuffer cmd" interrupt would be raised when filtering
>> happens. Is that interrupt disabled by default or it would cause 'unhandled
>> interrupt'?
>>
> 
> It's disabled by default. Jobs that are stopped by the filter are then handled
> by the usual timeout mechanism.
> 

Alright, then it looks good to me.

Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Dmitry
