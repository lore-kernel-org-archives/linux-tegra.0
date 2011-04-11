From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Tegra ASoC, multiple boards, platform data,
 and conditionals in machine driver
Date: Mon, 11 Apr 2011 13:30:44 -0700
Message-ID: <20110411203044.GF29405@opensource.wolfsonmicro.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3A50@HQMAIL01.nvidia.com>
	<20110409023057.GA3792@opensource.wolfsonmicro.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0493EB3B5B@HQMAIL01.nvidia.com>
	<BANLkTikQhe1+ufvZWFKU1DT+XCS9=xE0Xw@mail.gmail.com>
	<20110411015809.GA23214@sirena.org.uk>
	<74CDBE0F657A3D45AFBB94109FB122FF0493EB3B8D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0493EB3B8D@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Erik Gilling (konkers@google.com)" <konkers@google.com>, "Colin Cross (ccross@android.com)" <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 11, 2011 at 08:27:51AM -0700, Stephen Warren wrote:
> Mark Brown wrote at Sunday, April 10, 2011 7:58 PM:

> > you pass the full thing through platform datra or do you just pass the
> > machine type.

> Well, I was thinking of eliminating platform data completely; the
> selection of the correct ASoC machine driver would be based on the

Right, the machine type is essentially platform data.

> name of the platform device, and the machine driver would use
> machine_is_*() to determine any machine-specific actions/data. So yes,
> at run-time, but not using runtime-determined data *tables* at all.

There'd be data of some kind in the machine driver, even if they
happened to be coded as if statements.
