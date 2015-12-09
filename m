From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] Add support for tegrarcm's --usb-port-path cmdline
 option
Date: Wed, 9 Dec 2015 16:49:00 -0700
Message-ID: <5668BDEC.7070608@wwwdotorg.org>
References: <1449596849-27393-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449596849-27393-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/08/2015 10:47 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This allows the user to specify which USB device to operate on. See
> the related tegrarcm commit for a full description of this option and
> how to calculate the required option value. An example is:
>
>      ./tegra-uboot-flasher exec --usb-port-path 3-10.5 jetson-tk1

I have applied this series.
