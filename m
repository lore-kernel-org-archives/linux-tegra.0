From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration
 callback
Date: Mon, 30 Jul 2018 10:04:42 +0100
Message-ID: <20180730090441.GE28143@trinity.fluff.org>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <20180730084908.GB5789@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20180730084908.GB5789@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 30, 2018 at 09:49:08AM +0100, Mark Brown wrote:
> On Fri, Jul 27, 2018 at 01:59:29PM +0100, Jorge Sanjuan wrote:
> > From: Edward Cragg <edward.cragg@codethink.co.uk>
> > 
> > Add a callback to configure TDM settings for the Tegra30
> > I2S ASoC 'platform' driver.
> > 
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> This says it was britten by Edward but there's a signoff from Ben before
> his?

Editing accdient, I was originally going to submit this series.
 
> > +	dev_dbg(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x"
> > +		"slots: 0x%08x width: %d\n",
> > +		__func__, tx_mask, rx_mask, slots, slot_width);
> 
> Please don't split log messages over lines, it makes it harder to grep
> for them.  Just use a long line.
> 
> I'm also not seeing any validation of the parameters?



> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel


-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
