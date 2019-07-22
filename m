From: Lars Persson <lists@bofh.nu>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page Pool
Date: Mon, 22 Jul 2019 13:11:50 +0200
Message-ID: <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
References: <cover.1562149883.git.joabreu@synopsys.com> <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com> <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722101830.GA24948@apalos>
Sender: linux-kernel-owner@vger.kernel.org
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 22, 2019 at 12:18 PM Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Thu, Jul 18, 2019 at 07:48:04AM +0000, Jose Abreu wrote:
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Jul/17/2019, 19:58:53 (UTC+00:00)
> >
> > > Let me know if you have any thoughts.
> >
> > Can you try attached patch ?
> >
>
> The log says  someone calls panic() right?
> Can we trye and figure were that happens during the stmmac init phase?
>

The reason for the panic is hidden in this one line of the kernel logs:
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

The init process is killed by SIGSEGV (signal 11 = 0xb).

I would suggest you look for data corruption bugs in the RX path. If
the code is fetched from the NFS mount then a corrupt RX buffer can
trigger a crash in userspace.

/Lars
