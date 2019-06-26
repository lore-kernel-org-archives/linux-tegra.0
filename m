From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH 1/2] net: stmmac: Fix possible deadlock when disabling EEE support
Date: Wed, 26 Jun 2019 11:29:36 -0400
Message-ID: <CA+FuTSfWnen_t9r=BghkzzBwy=b_wazvtjPwg0ALtq30Cv-BGw@mail.gmail.com>
References: <20190626102322.18821-1-jonathanh@nvidia.com> <20190626104525.GH6362@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626104525.GH6362@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Network Development <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 26, 2019 at 6:45 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Jun 26, 2019 at 11:23:21AM +0100, Jon Hunter wrote:
> > When stmmac_eee_init() is called to disable EEE support, then the timer
> > for EEE support is stopped and we return from the function. Prior to
> > stopping the timer, a mutex was acquired but in this case it is never
> > released and so could cause a deadlock. Fix this by releasing the mutex
> > prior to returning from stmmax_eee_init() when stopping the EEE timer.
> >
> > Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Tested-by: Thierry Reding <treding@nvidia.com>

Acked-by: Willem de Bruijn <willemb@google.com>
