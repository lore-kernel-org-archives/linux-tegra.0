From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DT: tegra: Add Tegra30 Beaver board support
Date: Fri, 28 Dec 2012 16:54:46 -0700
Message-ID: <50DE3146.6090001@nvidia.com>
References: <1356032489-27619-1-git-send-email-pengw@nvidia.com> <50DDC743.2080606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50DDC743.2080606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bryan Wu <pengw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/28/2012 09:22 AM, Rob Herring wrote:
> On 12/20/2012 01:41 PM, Bryan Wu wrote:
>> This patch adds support for Tegra30 Beaver board in upstream kernel.

>> diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts

>> +/ {
>> +	model = "NVIDIA Tegra30 Beaver evaluation board";
>> +	compatible = "nvidia,beaver", "nvidia,tegra30";
> 
> nvidia,beaver needs to be documented.

Hmmm. I guess we've managed not to document /any/ of the Tegra
board-level compatible values. Bryan, could you make a separate patch to
add all the existing board compatible values to
Documentation/devicetree/bindings/arm/tegra.txt. The Beaver addition to
that file can still be part of the Beaver-specific patch though.
