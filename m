From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 1/2] ARM: tegra: import latest Jetson TK1 pinmux
Date: Wed, 18 Feb 2015 13:28:22 -0700
Message-ID: <54E4F5E6.5010705@wwwdotorg.org>
References: <1424199369-10937-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424199369-10937-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/17/2015 11:56 AM, Stephen Warren wrote:
> syseng has revamped the Jetson TK1 pinmux spreadsheet, basing the content
> completely on correct configuration for the board/schematic, rather than
> the previous version which was based on the bare minimum changes relative
> to another reference board.
>
> The new spreadsheet sets TRISTATE for any input-only pins. This only works
> correctly if the global CLAMP bit is not set, so any code importing this
> updated version will need to be adjusted accordingly. Apparently syseng
> have changed their mind since the previous advice that this needed to be
> set:-/
>
> This content comes from Jetson_TK1_customer_pinmux.xlsm (v09) downloaded
> from https://developer.nvidia.com/hardware-design-and-development.

I've applied these patches.
