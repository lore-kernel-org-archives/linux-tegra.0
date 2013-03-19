From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch v3 0/4] Add support for tps65090-charger
Date: Tue, 19 Mar 2013 12:05:00 -0400
Message-ID: <51488CAC.5030202@nvidia.com>
References: <1363126089-9071-1-git-send-email-rklein@nvidia.com> <20130319022402.GA14118@lizard.gateway.2wire.net> <51488A75.6000003@nvidia.com> <20130319155945.GA17614@lizard.gateway.2wire.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130319155945.GA17614-1CZZkhFgUWNRmOO2HpYVOJIbA5emDH3N@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 3/19/2013 11:59 AM, Anton Vorontsov wrote:
> On Tue, Mar 19, 2013 at 11:55:33AM -0400, Rhyland Klein wrote:
>> On 3/18/2013 10:24 PM, Anton Vorontsov wrote:
>>> On Tue, Mar 12, 2013 at 06:08:05PM -0400, Rhyland Klein wrote:
>>>> This patchset adds support for the TPS65090-charger. This charger is
>>>> registered as a subdevice of the TPS65090 PMIC.
>>>>
>>>> This series includes a fix for the tps65090 header file where all
>>>> the interrupts were shifted by 1.
>>>
>>> Thanks for the patches, Rhyland! 3/4 and 4/4 applied to the
>>> battery-2.6.git tree.
>>>
>> I was planning on posting a slightly changed v4 sometime soon which took
>> care of some concerns on the Documentation and added a compatibility
>> entry for the charger. Do you want me to send that still and you can
>> replace v3 with v4?
> 
> I would rather avoid replacing, i.e. I'd prefer if you send an update on
> top of the v3 (incremental patch). If the changes were inspired by
> someone, feel free to add a Suggested-by: tag. ;-)
> 
> Thanks!
> 
> Anton
> 
Will Do! the changes won't be big I don't think. Thanks!

-rhyland

-- 
nvpublic
