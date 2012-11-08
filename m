From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: tegra: fix suspend/resume apis
Date: Thu, 8 Nov 2012 22:24:01 +0100
Message-ID: <CACRpkdYm283wr6Si4qcGw5LxCnEWrnT2xPqHfJCPonL7tCcLMA@mail.gmail.com>
References: <1352300492-24779-1-git-send-email-ldewangan@nvidia.com>
	<1352300492-24779-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352300492-24779-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 7, 2012 at 4:01 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Following are changes done to fix the suspend/resume
> functionality of tegra gpio driver:
> - Protect suspend/resume callbacks with CONFIG_PM_SLEEP
>   because CONFIG_PM doesn't actually enable any of the PM callbacks, it
>   only allows to enable CONFIG_PM_SLEEP and CONFIG_PM_RUNTIME.
>   This means if CONFIG_PM is used to protect system sleep callbacks
>   then it may end up unreferenced if only runtime PM is enabled.
>
> - Fix the suspend/resume APIs declaration as per callback prototype.
>
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

OK patch applied to my devel branch, with Stephens ACK
and I also fixed the whitespace issue he pointed out.

Yours,
Linus Walleij
