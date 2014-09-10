From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH 1/3] ASoC: tegra: add tegra sgtl5000
	machine driver
Date: Wed, 10 Sep 2014 22:52:05 +0200
Message-ID: <1410382325.16012.11.camel@localhost.localdomain>
References: <cover.1410276224.git.marcel@ziswiler.com>
 <f90791ebb1799a4aa62dd6b527885ddadae3c058.1410276224.git.marcel@ziswiler.com>
 <CAOMZO5BYGwHGSeHeaQxEO=BUBGbno9P29et582SDzmwmfVioZA@mail.gmail.com>
 <541083EC.7080803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <541083EC.7080803@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Russell King <linux@arm.linux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, stefan@agner.ch, linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2014-09-10 at 11:01 -0600, Stephen Warren wrote:
> I don't think that will work; the Tegra audio complex requires some 
> clock management that doesn't immediately seem to fit into the 
> simple-audio-card concept.

Could you elaborate on that one? At least for our use case it seems to
work just fine. See v2 following ASAP.
