From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH -next] ASoC: tegra20-ac97: add missing
 clk_disable_unprepare() on error path
Date: Mon, 16 Dec 2013 10:12:08 -0700
Message-ID: <52AF3468.2050203@wwwdotorg.org>
References: <CAPgLHd8f20ryuiZwUqAHfWb4Uujp6=XyNosVWxjD5E9e7kBdow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAPgLHd8f20ryuiZwUqAHfWb4Uujp6=XyNosVWxjD5E9e7kBdow@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Wei Yongjun <weiyj.lk@gmail.com>, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, thierry.reding@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: linux-tegra@vger.kernel.org, yongjun_wei@trendmicro.com.cn, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/2013 10:29 PM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Add the missing clk_disable_unprepare() before return from
> tegra20_ac97_platform_probe() in the error handling case.

Reviewed-by: Stephen Warren <swarren@nvidia.com>

Mark, I did check that this patch doesn't conflict with any of the ASoC
changes I have in the Tegra tree, so there should be no issue when you
apply it. The same goes for the previous patch from Wei too, which fixes
some return values from this same function.
