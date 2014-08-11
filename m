From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [patch 1/2] pinctrl: tegra-xusb: fix an off by one test
Date: Mon, 11 Aug 2014 08:55:42 +0200
Message-ID: <CACRpkdYrJOBLDcZPoVxY855HDT=VuMjBWrzYOixRs7jLB0SYpQ@mail.gmail.com>
References: <20140731152217.GD31539@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140731152217.GD31539@mwanda>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 31, 2014 at 5:22 PM, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:

> This shoudld be ">= ARRAY_SIZE()" instead of "> ARRAY_SIZE()".
>
> Fixes: dc0a39386687 ('pinctrl: Add NVIDIA Tegra XUSB pad controller support')
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Patch applied with Stephen's and Thierry's ACKs.

Yours,
Linus Walleij
