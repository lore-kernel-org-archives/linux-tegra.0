From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] mfd: tps65910: Add device-tree support
Date: Thu, 19 Apr 2012 09:35:49 -0600
Message-ID: <4F9030D5.2050601@wwwdotorg.org>
References: <1334710829-22777-1-git-send-email-rklein@nvidia.com> <1334710829-22777-4-git-send-email-rklein@nvidia.com> <20120418090133.GC3021@opensource.wolfsonmicro.com> <1334777758.32315.37.camel@rklein-linux> <20120419125041.GH3046@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120419125041.GH3046-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/19/2012 06:50 AM, Mark Brown wrote:
> On Wed, Apr 18, 2012 at 12:35:58PM -0700, Rhyland Klein wrote:
>> On Wed, 2012-04-18 at 02:01 -0700, Mark Brown wrote:
> 
>>> This is a really odd idiom - normally the pattern for device tree
>>> support is to just go and try to use the device tree data if it's there
>>> and there's no need for any flag to say if it should be used.
> 
>> I agree its odd. My concern was that the idiom is that is pdata assigned
>> from board files should override dt data. At this point, we don't know
>> where the tps65910->board_data is coming from, dt or board files.
>> Arbitrarily using dt breaks that idiom. We could do a check like this if
>> you prefer:
> 
> No, just prefer the DT - what you're proposing is exactly the opposite
> idiom to what all the other DT drivers do so we'd need to go round
> changing the policy globally at which point we probably want to start
> having helpers for this.

That's not right - the idea is that pdata should override device tree so
that if there's a platform where the DT is known to contain incorrect
data, then some early platform code can add pdata to the device to fix
the problem, and that will be used in preference to the DT data.

At least, that's the last I heard Grant say on the subject, and that's
how I've been writing all the Tegra-related drivers, and I've seen
others do the same for other platforms.
