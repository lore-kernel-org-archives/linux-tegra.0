From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND PATCH 0/3] arm: tegra: dts: USB Updates for Tegra legacy
 mode / OTG
Date: Wed, 07 Mar 2012 13:51:01 -0700
Message-ID: <4F57CA35.50406@wwwdotorg.org>
References: <1331096674-8324-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331096674-8324-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 10:04 PM, Simon Glass wrote:
> This little series brings in some bindings that seem useful for U-Boot.
> 
> I am working mostly in U-Boot, but since there is no shared .dts repo
> I was asked to commit these changes to the kernel. I do not propose to
> update the Linux USB drivers to match.
> 
> 
> Simon Glass (3):
>   arm: tegra: dts: Support host/device selection and legacy mode
>   arm: tegra: dts: Add legacy mode support to Tegra2x USB1 port
>   arm: tegra: dts: Mark USB1 as an OTG port on Seaboard

I ack'd this before, but just in case it got lost: The series,

Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
