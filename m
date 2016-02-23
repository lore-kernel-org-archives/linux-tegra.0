From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: regulator: core: Request GPIO before creating sysfs entries
Date: Tue, 23 Feb 2016 13:22:38 +0000
Message-ID: <56CC5D1E.6010101@nvidia.com>
References: <1456129440-28143-1-git-send-email-krzysztof.adamski@tieto.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456129440-28143-1-git-send-email-krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark, Krzysztof,

It appears that commit daad134d6649 ("regulator: core: Request GPIO
before creating sysfs entries") breaks boot on tegra124-nyan-big in
-next today.

Looking at the change, it does not appear that the exit path has been
updated correctly and so if a regulator is deferred then there is a
crash in the exit path. I am not sure that there is a simple way to
workaround this because of fix from commit 53032dafc6b9 ("regulator
core: fix double-free in regulator_register() error path") unless we
move regulator_ena_gpio_free() into regulator_dev_release().

Cheers
Jon
