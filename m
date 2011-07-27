From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: tegra: only select MACH_HAS_SND_SOC_TEGRA_WM8903
	if SND_SOC
Date: Wed, 27 Jul 2011 18:33:57 +0200
Message-ID: <201107271833.57993.arnd@arndb.de>
References: <74CDBE0F657A3D45AFBB94109FB122FF049EBDF52B@HQMAIL01.nvidia.com>
	<201107271711.05040.arnd@arndb.de>
	<20110727153144.GU16561@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110727153144.GU16561@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Warren <swarren@nvidia.com>, "Olof Johansson (olof@lixom.net)" <olof@lixom.net>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 27 July 2011, Uwe Kleine-K=F6nig wrote:
> On Wed, Jul 27, 2011 at 05:11:04PM +0200, Arnd Bergmann wrote:
> > Applied to 'fixes' branch, thanks everyone!
> Would you care to take the other patch in this series, too?
> (http://thread.gmane.org/gmane.linux.ports.tegra/1138/focus=3D1139)

That does not look like a bug fix to me. I don't mind the patch,
but I see no reason to apply it at this point, or to the 'fixes'
branch.

I'll wait for Colin to accumulate more patches and then pull those
from him into a tegra specific branch for 3.2, ok? If Colin wants
to have it 3.1, I can pull it into the fixes branch after -rc1.

	Arnd
