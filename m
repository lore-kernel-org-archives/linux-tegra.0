From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: remove useless includes of <mach/*.h>
Date: Sat, 1 Sep 2012 00:53:11 +0200
Message-ID: <CACRpkda3qN3VVOv6TxjXB9qTZc4CszvQpLb+mO1pdf1OuCn2wg@mail.gmail.com>
References: <1346137196-7138-1-git-send-email-swarren@wwwdotorg.org>
	<503CFDFC.7060607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <503CFDFC.7060607-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 28, 2012 at 7:21 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 08/27/2012 11:59 PM, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Nothing from these files is needed, so remove the includes. This helps
>> single zImage work by reducing use of the mach-tegra/include/mach/
>> directory.
>
> BTW, it'd be easiest for me to take this through the Tegra tree, since I
> may be able to delete <mach/suspend.h> after this.

OK go ahead,
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
