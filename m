From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Patch V4 2/2] mfd: tps65090: Add resources for charger
Date: Wed, 10 Apr 2013 13:14:02 -0400
Message-ID: <51659DDA.8090108@nvidia.com>
References: <1363897842-19835-1-git-send-email-rklein@nvidia.com> <1363897842-19835-2-git-send-email-rklein@nvidia.com> <20130408160138.GA24058@zurbaran>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130408160138.GA24058@zurbaran>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 4/8/2013 12:01 PM, Samuel Ortiz wrote:
> Hi Rhyland,
> 
> On Thu, Mar 21, 2013 at 04:30:42PM -0400, Rhyland Klein wrote:
>> Add irq resources to pass to the charger mfd sub dev so
>> the charger can listen for interrupts.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v4:
>>  - Added of_compatible string to resources for tps65090-charger
>> v3:
>>  - no changes since v2
>> v2:
>>  - no changes since v1
>>
>>  drivers/mfd/tps65090.c |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
> Applied as well, thanks.
> 
> Cheers,
> Samuel.
> 
It looks like the merged version was not V4 but an earlier one. V4 added
in the of_compatible string for the charger subnode and I don't see that
in the version in linux-next. I guess I'll post a new patch to add that
separately.

-rhyland

-- 
nvpublic
