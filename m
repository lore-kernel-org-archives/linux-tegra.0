From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] soc/tegra: Fix terminating condition
Date: Thu, 22 Nov 2018 16:58:00 +0800
Message-ID: <CAEExFWsLSm5oN+avMS1+HSWjrGNwLhGCm3u_TLDbv+YTRt8+ew@mail.gmail.com>
References: <20181122075244.3909-1-natechancellor@gmail.com> <20181122085022.GB5741@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122085022.GB5741@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, ndesaulniers@google.com
List-Id: linux-tegra@vger.kernel.org

Hi Thierry:

How about change it to this?
            while (*match->compatible) {
This is more beautiful.    :-)

Thanks,
Yangtao
On Thu, Nov 22, 2018 at 4:50 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Thu, Nov 22, 2018 at 12:52:44AM -0700, Nathan Chancellor wrote:
> > Clang warns:
> >
> > drivers/soc/tegra/common.c:27:16: error: address of array
> > 'match->compatible' will always evaluate to 'true'
> > [-Werror,-Wpointer-bool-conversion]
> >         while (match->compatible) {
> >         ~~~~~  ~~~~~~~^~~~~~~~~~
> > 1 error generated.
> >
> > Whoops, we have an infinite loop and QEMU no longer boots...
> >
> > https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/160242918
> >
> > Check that the first character of the string isn't null so that the loop
> > properly terminates.
> >
> > Fixes: c57eff9503a5 ("soc/tegra: refactor soc_is_tegra()")
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  drivers/soc/tegra/common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Wow... that's what I get from not testing this properly. Apologies for
> the inconvenience.
>
> Applied, thanks.
>
> Thierry
