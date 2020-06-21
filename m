From: Markus Elfring <Markus.Elfring-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH v4] dmaengine: tegra210-adma: Fix runtime PM imbalance on
 error
Date: Sun, 21 Jun 2020 12:50:28 +0200
Message-ID: <d1872c79-7998-46cd-a7b6-6c5715391ca3@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinghao Liu <dinghao.liu-Y5EWUtBUdg4nDS1+zs4M5A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Aditya Pakki <pakki001-OJFnDUYgAso@public.gmane.org>, Kangjie Lu <kjlu-OJFnDUYgAso@public.gmane.org>, Navid Emamdoost <emamd001-OJFnDUYgAso@public.gmane.org>, Qiushi Wu <wu000273-OJFnDUYgAso@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I propose to combine two tags in the previous patch subject.


> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

* Can an imperative wording be nicer for the change description?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?id=3D64677779e8962c20b580b471=
790fe42367750599#n151

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit mess=
age?


> ---
> drivers/dma/tegra210-adma.c | 5 ++++-

I find it nicer to replace the triple dashes before this diffstat
by a blank line.

Regards,
Markus
