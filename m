From: Liam Girdwood <lrg@ti.com>
Subject: Re: [PATCH 3/3] ASoC: Tegra: Implement SPDIF CPU DAI
Date: Mon, 4 Jul 2011 11:10:48 +0100
Message-ID: <4E1191A8.3070000@ti.com>
References: <1309550175-30551-1-git-send-email-swarren@nvidia.com>
	<1309550175-30551-4-git-send-email-swarren@nvidia.com>
	<20110702191607.GA10505@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20110702191607.GA10505@opensource.wolfsonmicro.com>
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-tegra@vger.kernel.org

On 02/07/11 20:16, Mark Brown wrote:
> On Fri, Jul 01, 2011 at 01:56:15PM -0600, Stephen Warren wrote:
> 
>> +struct snd_soc_dai_driver tegra_spdif_dai = {
>> +	.name = DRV_NAME ".0",
> 
> This looks wrong - what's with the .0?  If there can be only one device
> there should be no number, if there can be multiple devices hard coding
> is bad karma.  Either way the number should come from the instantiation.

After this comment has been fixed.

Acked-by: Liam Girdwood <lrg@ti.com>
