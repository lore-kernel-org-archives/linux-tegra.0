From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] Add man pages
Date: Thu, 8 Oct 2015 12:07:14 -0600
Message-ID: <5616B0D2.5080709@wwwdotorg.org>
References: <1444257480-24964-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444257480-24964-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2015 04:38 PM, Allen Martin wrote:
> Add man pages for cbootimge(1) and bct_dump(1)

A few minor nits below. If the fixes I suggest look good, I can fix them 
up when applying this.

> diff --git a/src/bct_dump.1.in b/src/bct_dump.1.in

> +.SH SEE ALSO
> +.BR tegrarcm (1), cbootimage(1)

Remove the space before the first (1)?

> +To disassmble the BCT file for a Tegra124 Jetson-TK1:

disassemble

> +.SH AUTHOR
> +Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I don't recall; is the man page author tag supposed to reflect the 
author of the tool or the author of the man page?

> diff --git a/src/cbootimage.1.in b/src/cbootimage.1.in

> +.B \-o\fIodm_data\fP
> +Specify the odm_data(in hex).

odm_data value (in hex). ?

> +.SH SEE ALSO
> +.BR tegrarcm (1), bct_dump(1)
> +
> +.SH AUTHOR
> +Peer Chen <pchen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Same questions here as above.
