From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] ASoC: tegra: Remove redundant
 initialisation of compat_filter_fn
Date: Sat, 19 Oct 2013 19:26:58 +0200
Message-ID: <5262C0E2.6010809@metafoo.de>
References: <1382188623-19494-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1382188623-19494-1-git-send-email-broonie@kernel.org>
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
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On 10/19/2013 03:17 PM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Setting a field in a static struct to NULL has no effect so don't bother
> (and don't generate false positives for grep).

The idea was to make it explicit that tegra uses the compat path, but with
the filter function set to NULL.

- Lars
