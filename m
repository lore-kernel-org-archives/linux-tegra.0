From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding rework
Date: Wed, 03 Apr 2013 13:38:09 -0600
Message-ID: <515C8521.7070606@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com> <5148C253.6030007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5148C253.6030007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/19/2013 01:53 PM, Stephen Warren wrote:
> On 03/18/2013 06:29 AM, Venu Byravarasu wrote:
>> This patch updates all Tegra board files so that they contain all the
>> properties required by the updated USB DT binding. Note that this patch
>> only adds the new properties and does not yet remove the old properties,
>> in order to maintain bisectability. The old properties will be removed
>> once the driver has been updated to assume the new bindings.
>>
>> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra20-colibri-512.dtsi |    4 +++
>>  arch/arm/boot/dts/tegra20-harmony.dts      |    8 +++---
>>  arch/arm/boot/dts/tegra20-iris-512.dts     |    4 +++
>>  arch/arm/boot/dts/tegra20-paz00.dts        |    8 +++---
>>  arch/arm/boot/dts/tegra20-seaboard.dts     |   13 +++++++---
>>  arch/arm/boot/dts/tegra20-trimslice.dts    |   12 +++++++---
>>  arch/arm/boot/dts/tegra20-ventana.dts      |    7 +++--
>>  arch/arm/boot/dts/tegra20.dtsi             |   32 +++++++++++++++++----------
>>  8 files changed, 57 insertions(+), 31 deletions(-)
> 
> I think you forgot to update arch/arm/boot/dts/tegra20-whistler.dts in
> this patch.

This was not fixed in V2.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
