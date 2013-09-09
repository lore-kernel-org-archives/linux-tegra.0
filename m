From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 00/11] tegrarcm: T124 and new command support
Date: Mon, 09 Sep 2013 15:57:52 -0600
Message-ID: <522E4460.1090905@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:15 PM, Allen Martin wrote:
> This patch series adds T124 support to tegrarcm, tested on laguna.  It
> also adds support for new commands for ripping a BCT from a live
> system, for passing in the miniloader from a file, and for passing in
> the odmdata on the command line.  Also fixed up some of the error
> handling so now USB commands will time out instead of hanging, and
> attempt to bring up nv3p even if RCM is unresponsive.

Aside from the few relatively minor comments I made, the series,
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
