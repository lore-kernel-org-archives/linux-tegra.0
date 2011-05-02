From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [PATCH v3] ASoC: tegra: TrimSlice machine support
Date: Mon, 02 May 2011 19:33:27 +0100
Message-ID: <1304361207.3263.17.camel@odin>
References: <1303807962-14833-1-git-send-email-mike@compulab.co.il>
	<4DBE425C.2030807@compulab.co.il> <20110502092228.GA2916@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20110502092228.GA2916@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2011-05-02 at 10:22 +0100, Mark Brown wrote:
> On Mon, May 02, 2011 at 08:34:20AM +0300, Mike Rapoport wrote:
> > Mark,
> > Any updates on this?
> 
> Since you didn't CC Liam he hasn't revewied the patch yet.  I've added
> him now.
> 
> > 
> > On 04/26/11 11:52, Mike Rapoport wrote:
> > > Signed-off-by: Mike Rapoport <mike@compulab.co.il>
> > > ---
> > > v3 changes:
> > > * s/SND_TEGRA_SOC/SND_SOC_TEGRA
> > > * drop 'default' setting in Kconfig
> > > 
> > > v2 changes:
> > > * address Stephen and Mark comments
> > > * rebase against Mark's for-next branch
> > > * switch to data based specification of widgets and routes
> > > * explicitly disable unused codec pins
> > > 
> > >  sound/soc/tegra/Kconfig     |    8 ++
> > >  sound/soc/tegra/Makefile    |    2 +
> > >  sound/soc/tegra/trimslice.c |  228 +++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 238 insertions(+), 0 deletions(-)
> > >  create mode 100644 sound/soc/tegra/trimslice.c

Acked-by: Liam Girdwood <lrg@ti.com>
