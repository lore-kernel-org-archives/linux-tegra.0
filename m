From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Mon, 22 Jul 2019 14:04:49 +0000
Message-ID: <BN8PR12MB3266664ECA192E02C06061EED3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190722101830.GA24948@apalos>
 <CADnJP=thexf2sWcVVOLWw14rpteEj0RrfDdY8ER90MpbNN4-oA@mail.gmail.com>
 <BN8PR12MB326661846D53AAEE315A7434D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
 <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <11557fe0-0cba-cb49-0fb6-ad24792d4a53@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Lars Persson <lists@bofh.nu>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

From: Jon Hunter <jonathanh@nvidia.com>
Date: Jul/22/2019, 13:05:38 (UTC+00:00)

> 
> On 22/07/2019 12:39, Jose Abreu wrote:
> > From: Lars Persson <lists@bofh.nu>
> > Date: Jul/22/2019, 12:11:50 (UTC+00:00)
> > 
> >> On Mon, Jul 22, 2019 at 12:18 PM Ilias Apalodimas
> >> <ilias.apalodimas@linaro.org> wrote:
> >>>
> >>> On Thu, Jul 18, 2019 at 07:48:04AM +0000, Jose Abreu wrote:
> >>>> From: Jon Hunter <jonathanh@nvidia.com>
> >>>> Date: Jul/17/2019, 19:58:53 (UTC+00:00)
> >>>>
> >>>>> Let me know if you have any thoughts.
> >>>>
> >>>> Can you try attached patch ?
> >>>>
> >>>
> >>> The log says  someone calls panic() right?
> >>> Can we trye and figure were that happens during the stmmac init phase?
> >>>
> >>
> >> The reason for the panic is hidden in this one line of the kernel logs:
> >> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >>
> >> The init process is killed by SIGSEGV (signal 11 = 0xb).
> >>
> >> I would suggest you look for data corruption bugs in the RX path. If
> >> the code is fetched from the NFS mount then a corrupt RX buffer can
> >> trigger a crash in userspace.
> >>
> >> /Lars
> > 
> > 
> > Jon, I'm not familiar with ARM. Are the buffer addresses being allocated 
> > in a coherent region ? Can you try attached patch which adds full memory 
> > barrier before the sync ?
> 
> TBH I am not sure about the buffer addresses either. The attached patch
> did not help. Same problem persists.

OK. I'm just guessing now at this stage but can you disable SMP ?

We have to narrow down if this is coherency issue but you said that 
booting without NFS and then mounting manually the share works ... So, 
can you share logs with same debug prints in this condition in order to 
compare ?

---
Thanks,
Jose Miguel Abreu
