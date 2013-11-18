From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 16/31] ASoC: tegra: use reset framework
Date: Mon, 18 Nov 2013 10:21:16 -0700
Message-ID: <528A4C8C.3030200@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-17-git-send-email-swarren@wwwdotorg.org>
 <20131116095529.GF15393@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20131116095529.GF15393@sirena.org.uk>
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
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, pdeschrijver@nvidia.com, Liam Girdwood <lgirdwood@gmail.com>, linux-tegra@vger.kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 11/16/2013 02:55 AM, Mark Brown wrote:
> On Fri, Nov 15, 2013 at 01:54:11PM -0700, Stephen Warren wrote:
> 
>> @@ -1,6 +1,8 @@ config SND_SOC_TEGRA tristate "SoC Audio for the
>> Tegra System-on-Chip" depends on (ARCH_TEGRA && TEGRA20_APB_DMA)
>> || COMPILE_TEST +	depends on COMMON_CLK +	depends on
>> RESET_CONTROLLER
> 
> Do you depend on COMMON_CLK here?  I only noticed reset controller
> API dependencies here but perhaps I missed this (or it's fixing a
> dependency that should be there already).

It's fixing a dependency that should already be there, in the
COMPILE_TEST case. In the (ARCH_TEGRA && TEGRA20_APB_DMA) case,
COMMON_CLOCK is always selected.

Do you want me to split this out into a separate patch? If so, I'd
prefer not to apply that separate patch immediately to 3.13 as a fix,
since then it'd delay applying this series until after -rc2 is out,
unless you can get the fix into -rc1 quickly...
