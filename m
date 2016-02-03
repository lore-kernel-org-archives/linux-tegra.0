From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] Use non-zero address for CRC calculations
Date: Wed, 3 Feb 2016 09:43:19 -0700
Message-ID: <56B22E27.8050603@wwwdotorg.org>
References: <1454459458-7177-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454459458-7177-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/02/2016 05:30 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Currently, U-Boot's itest command cannot read from address 0. On Tegra20,
> soc['ram-base'] can be 0, and is the address passed to itest. Modify the
> code to use an offset from this address, so as not to use address 0.
>
> Note that in Tegra30 and later, the RAM base is non-zero, so this issue
> does not occur. This issue also only affects the "flash" command, and not
> the "exec" command.
>
> A patch is also in progress to fix the itest command in U-Boot. However,
> fixing tegra-uboot-flasher not to use address 0 seems reasonable too, and
> will immediately solve the issue irrespective of which U-Boot code-base is
> in use.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Untested so far since I'm working from home today due to snowfall and can't
> remotely plug in my old Tegra20 HW. I'll test before I apply this tomorrow.

Tested on Seaboard/Springbank and Jetson TK1, and applied.
