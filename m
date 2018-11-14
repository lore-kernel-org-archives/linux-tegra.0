From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] mailbox: tegra-hsp: use devm_kstrdup_const()
Date: Wed, 14 Nov 2018 09:27:17 +0100
Message-ID: <CAMRc=Mcdw5rfnXhrj7BSGTocU1HfACtTXraE1EgWe5dxw2SUTA@mail.gmail.com>
References: <20181108164610.28361-1-brgl@bgdev.pl> <20181113211144.GC2724@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113211144.GC2724@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

wt., 13 lis 2018 o 22:11 Thierry Reding <thierry.reding@gmail.com> napisa=
=C5=82(a):
>
> On Thu, Nov 08, 2018 at 05:46:10PM +0100, Bartosz Golaszewski wrote:
> > Use devm_kstrdup_const() in the tegra-hsp driver. This mostly serves as
> > an example of how to use this new routine to shrink driver code.
> >
> > Also use devm_kzalloc() instead of regular kzalloc() to shrink the
> > driver even more.
> >
> > Doorbell objects are only removed in the driver's remove callback so
> > it's safe to convert all memory allocations to devres.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  drivers/mailbox/tegra-hsp.c | 41 ++++++++-----------------------------
> >  1 file changed, 9 insertions(+), 32 deletions(-)
>
> This looks really nice. I'm currently working on a series of patches to
> add shared mailboxes to the HSP driver. Part of that series adds struct
> device *dev to struct tegra_hsp, which in turn would simplify this
> patch a little.
>
> Looking at some of the changes here it also seems like they would
> conflict with my patches in some places. Would you mind if I pick this
> patch up into my series and resolve the conflicts there?
>

Not at all, please do. I just want to add at least one example user of
the routine (devm_kstrdup_const) I introduced in the last merge
window.

Best regards,
Bartosz Golaszewski
