From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: tegra: Move drivers registration to
 arch_init level
Date: Mon, 6 Aug 2018 12:37:16 +0200
Message-ID: <CACRpkdYqpK4fuQ4g0WORnNDOPhDebXXJHJH0oGUVd+qmfimqLA@mail.gmail.com>
References: <20180802111144.12512-1-digetx@gmail.com> <4576764.PLucfz68jK@dimapc>
 <2086462.IQpRViTvQm@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2086462.IQpRViTvQm@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler <marcel@ziswiler.com>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 6, 2018 at 11:15 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> On Thursday, 2 August 2018 16:01:24 MSK Dmitry Osipenko wrote:
> > On Thursday, 2 August 2018 14:11:43 MSK Dmitry Osipenko wrote:
> > > There is a bug in regards to deferred probing within the drivers core
> > > that causes GPIO-driver to suspend after its users. The bug appears if
> >
> > I meant "before its users", of course. If the rest of the patches is fine,
> > please let me know if re-sending is needed or you'll correct the comment in
> > place while applying.
>
> Linus, please pick up the v2.

It's no big deal if the only difference is the commit message.

Yours,
Linus Walleij
