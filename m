From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [REGRESSION v5.2-rc] SUNRPC: Declare RPC timers as
 TIMER_DEFERRABLE (431235818bc3)
Date: Wed, 19 Jun 2019 14:38:05 +0100
Message-ID: <2aee35b5-f0f9-aac3-8957-01ebd4930f3b@nvidia.com>
References: <c54db63b-0d5d-2012-162a-cb08cf32245a@nvidia.com>
 <b2c142996bc25aff51a197db52015bf9222139fe.camel@hammerspace.com>
 <36e34e81-8399-be71-2dd6-399d70057657@nvidia.com>
 <313d971a-96ab-c7f0-34f5-631bb5f39e49@nvidia.com>
 <7d335b53c9878865cef1de83960701c0ece4e611.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d335b53c9878865cef1de83960701c0ece4e611.camel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <schumaker.anna@gmail.com>, Trond Myklebust <trondmy@hammerspace.com>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 18/06/2019 21:18, Anna Schumaker wrote:
> 
> On Tue, 2019-06-18 at 10:35 +0100, Jon Hunter wrote:
>> Trond, Anna,
>>
>> On 12/06/2019 15:23, Jon Hunter wrote:
>>> On 05/06/2019 23:01, Trond Myklebust wrote:
>>>
>>> ...
>>>
>>>> I'd be OK with just reverting this patch if it is causing a
>>>> performance
>>>> issue.
>>>>
>>>> Anna?
>>>
>>> Any update on this?
>>
>> I have not seen any update on this. Do you plan to revert this?
>>
>> We are getting ever closer to v5.2 and this problem still persists.
> 
> Hi Jon,
> 
> Sorry it took me so long to see this. I've applied the revert and
> pushed it out to my linux-next branch. I'm planning to send it with
> some other bugfixes this week.
Thanks Anna!

Jon
-- 
nvpublic
