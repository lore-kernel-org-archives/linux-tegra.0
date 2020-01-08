From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [PATCH] regmap: add iopoll-like atomic polling macro
Date: Wed, 8 Jan 2020 10:20:37 +0530
Message-ID: <ae119533-6966-157a-d14b-365306907554@nvidia.com>
References: <1578392889-16587-1-git-send-email-spujar@nvidia.com>
 <20200107120902.GC4877@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200107120902.GC4877@sirena.org.uk>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jonathanh@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/7/2020 5:39 PM, Mark Brown wrote:
> On Tue, Jan 07, 2020 at 03:58:09PM +0530, Sameer Pujar wrote:
>> This patch adds a macro 'regmap_read_poll_timeout_atomic' that works
>> similar to 'readx_poll_timeout_atomic' defined in linux/iopoll.h; This
>> is atomic version of already available 'regmap_read_poll_timeout' macro.
> In general regmap really can't be used in atomic contexts - we do have
> options to configure a regmap so it can be used there but they're not
> the default.  It'd be better if the comment mentioned this and warned
> against use with normal regmaps so people are less likely to try to use
> this in an atomic context when the regmap doesn't support that.

Oh I see.

While using regmap_read_poll_timeout() in snd_soc_dai_ops trigger 
callback, I was hitting below print.
"BUG: scheduling while atomic" and kernel panic there after.

While checking the documentation on snd_soc_dai_ops, it appears 
trigger() is in atomic context.
This means I cannot use regmap interface (with default configuration) in 
trigger().
The above issue went away with usage of 
regmap_read_poll_timeout_atomic() and now I think I just got lucky.

Also, with the limited testing, I did not see the issue in current 
linux-next, where as I hit above issue in
older kernel. Has anything changed with respect to above?

Though I need to test this, I guess there is a way to use non-atomic 
versions of PCM operations by setting
'nonatomic' flag in snd_pcm and continue to use 
regmap_read_poll_timeout(). In that case new macro may not
be necessary.
