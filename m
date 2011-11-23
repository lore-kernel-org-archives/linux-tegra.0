From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 13/17] ASoC: Tegra TrimSlice machine: Use
 devm_ APIs and module_platform_driver
Date: Wed, 23 Nov 2011 11:11:11 +0000
Message-ID: <20111123111110.GG21073@opensource.wolfsonmicro.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
	<1322011285-4002-14-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1322011285-4002-14-git-send-email-swarren@nvidia.com>
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
Cc: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, Mike Rapoport <mike@compulab.co.il>, Ian Lartey <ian@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, Marc Dietrich <marvin24@gmx.de>, Grant Likely <grant.likely@secretlab.ca>, linux-tegra@vger.kernel.org, John Bonesio <bones@secretlab.ca>, Leon Romanovsky <leon@leon.nu>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 22, 2011 at 06:21:21PM -0700, Stephen Warren wrote:
> module_platform_drive saves some boiler-plate code.
> 
> The devm_ APIs remove the need to manually clean up allocations,
> thus removing some code.

Applied, thanks - again should be split.
