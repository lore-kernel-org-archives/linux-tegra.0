From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [Linux-kernel] [PATCH 2/4] ASoC: tegra: Add a TDM
 configuration callback
Date: Mon, 30 Jul 2018 18:39:52 +0100
Message-ID: <a1289d568db3a5008ab11006b4c04952@codethink.co.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
 <20180730101800.GF5789@sirena.org.uk>
 <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
 <20180730150749.GK5789@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180730150749.GK5789@sirena.org.uk>
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
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 2018-07-30 16:07, Mark Brown wrote:
> On Mon, Jul 30, 2018 at 03:04:46PM +0100, Jon Hunter wrote:
>> On 30/07/18 11:18, Mark Brown wrote:
> 
>> > DSP modes only care about the rising edge of the LRCLK, the pulse can be
>> > any width without causing interoperability problems.
> 
>> OK, thanks I was not able to find a spec that defines this, but I saw 
>> a
>> lot of codecs use a single bit clock width. So then equally making the
>> default '1' should also be fine.
> 
> There's not really a spec for this, it's just what tends to be
> implemented.
> 
>> I still do not like configuring the fsync width in this function. The
>> fsync width needs to be configured for both DSP modes and normal I2S
>> modes and so it seems it would be more appropriate to do this in the
>> hw_params function for this driver.
> 
> You *could* just always use the I2S width, it's going to look odd when
> people use a scope but it will work most of the time.

We did this as we were dealing with a legacy system in which we didn't
know if this was important setting or not, so we tried to make the
settings as close as possible to the original nvidia supplied source.

-- 
Ben
