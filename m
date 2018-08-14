From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 01/14] staging: media: tegra-vde: Support BSEV clock and
 reset
Date: Tue, 14 Aug 2018 18:16:36 +0300
Message-ID: <1880224.sdO7jKkjlk@dimapc>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
 <20180814142124.GA21075@ulmo> <1939648.kLoYIjBhCz@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1939648.kLoYIjBhCz@dimapc>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday, 14 August 2018 18:05:51 MSK Dmitry Osipenko wrote:
> On Tuesday, 14 August 2018 17:21:24 MSK Thierry Reding wrote:
> > On Mon, Aug 13, 2018 at 06:09:46PM +0300, Dmitry Osipenko wrote:
> > > On Monday, 13 August 2018 17:50:14 MSK Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > > 
> > > > The BSEV clock has a separate gate bit and can not be assumed to be
> > > > always enabled. Add explicit handling for the BSEV clock and reset.
> > > > 
> > > > This fixes an issue on Tegra124 where the BSEV clock is not enabled
> > > > by default and therefore accessing the BSEV registers will hang the
> > > > CPU if the BSEV clock is not enabled and the reset not deasserted.
> > > > 
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > 
> > > Are you sure that BSEV clock is really needed for T20/30? I've tried
> > > already to disable the clock explicitly and everything kept working,
> > > though I'll try again.
> > 
> > I think you're right that these aren't strictly required for VDE to work
> > on Tegra20 and Tegra30. However, the BSEV clock and reset do exist on
> > those platforms, so I didn't see a reason why they shouldn't be handled
> > uniformly across all generations.
> 
> It's a bit messy to have unsed clock being enabled.
> 
> I guess BSEV clock on T20/30 only enables the AES engine. If the decryption
> engine is integrated with the video decoder, then the clock and reset should
> be requested by the driver, but BSEV should be kept disabled if it's not
> used.

Though even if encryption is not directly integrated with the video decoding, 
then it still makes sense to define the clock and reset in DT without using 
them by the VDE driver since the HW registers space is shared. If somebody 
would like to implement the AES driver, it could be made as a sub-device of 
VDE.
