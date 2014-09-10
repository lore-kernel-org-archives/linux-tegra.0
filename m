From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH 1/3] ASoC: tegra: add tegra sgtl5000 machine driver
Date: Wed, 10 Sep 2014 22:46:07 +0200
Message-ID: <1410381967.16012.8.camel@localhost.localdomain>
References: <cover.1410276224.git.marcel@ziswiler.com>
	 <f90791ebb1799a4aa62dd6b527885ddadae3c058.1410276224.git.marcel@ziswiler.com>
	 <CAOMZO5BYGwHGSeHeaQxEO=BUBGbno9P29et582SDzmwmfVioZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BYGwHGSeHeaQxEO=BUBGbno9P29et582SDzmwmfVioZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, stefan@agner.ch
List-Id: linux-tegra@vger.kernel.org

On Tue, 2014-09-09 at 15:00 -0300, Fabio Estevam wrote:
> What about using the simple-audio-card binding instead of adding the
> tegra_sgtl5000 machine driver?

Good question. I have to admit last I checked on the current state of
affairs on vybrid towards end of last year none of this existed yet.
Sweet. Will try and resubmit v2 with that in mind.

> An example of simple-audio-card used with sgtl5000 can be found here:
> 
> http://www.spinics.net/lists/devicetree/msg44466.html

While above linked example does not quite look like a proper example
thereof I do get the point. Please excuse my ignorance.
