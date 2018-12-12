From: Prateek Patel <prpatel@nvidia.com>
Subject: Re: [PATCH V2] kmemleak: Add config to select auto scan
Date: Wed, 12 Dec 2018 12:14:29 +0530
Message-ID: <a51a7d4b-6366-ea10-f220-992525ec1d42@nvidia.com>
References: <1540231723-7087-1-git-send-email-prpatel@nvidia.com>
 <20181029104320.GC168424@arrakis.emea.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029104320.GC168424@arrakis.emea.arm.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-tegra@vger.kernel.org, snikam@nvidia.com, vdumpa@nvidia.com, talho@nvidia.com, swarren@nvidia.com, treding@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Hi Catalin,

Can you mark this patch as acknowledged so that it can be picked up by 
the maintainer.

Adding Andrew.

Thanks,

On 10/29/2018 4:13 PM, Catalin Marinas wrote:
> On Mon, Oct 22, 2018 at 11:38:43PM +0530, Prateek Patel wrote:
>> From: Sri Krishna chowdary <schowdary@nvidia.com>
>>
>> Kmemleak scan can be cpu intensive and can stall user tasks at times.
>> To prevent this, add config DEBUG_KMEMLEAK_AUTO_SCAN to enable/disable
>> auto scan on boot up.
>> Also protect first_run with DEBUG_KMEMLEAK_AUTO_SCAN as this is meant
>> for only first automatic scan.
>>
>> Signed-off-by: Sri Krishna chowdary <schowdary@nvidia.com>
>> Signed-off-by: Sachin Nikam <snikam@nvidia.com>
>> Signed-off-by: Prateek <prpatel@nvidia.com>
> Looks fine to me.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
