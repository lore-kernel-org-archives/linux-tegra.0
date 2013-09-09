From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 09/11] tegrarcm: Add support for odmdata command
Date: Mon, 09 Sep 2013 15:53:51 -0600
Message-ID: <522E436F.90402@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-10-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-10-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:15 PM, Allen Martin wrote:
> Add command "--odmdata" to pass odmdata down to the miniloader.  This
> is used by the miniloader for things such as UART init and RAM sizing.
> It is normally not needed and is really only useful for miniloader
> debugging.

Does the miniloader put it into the BCT in IRAM so that the bootloader
can also read it? If suppose we expect the correct ODMDATA to be already
included in the BCT that tegrarcm sends though, so the bootloader
already sees the correct value.

I think usage() needs updating in this patch.
