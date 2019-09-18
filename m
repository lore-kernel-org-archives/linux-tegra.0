From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration
	callback
Date: Wed, 18 Sep 2019 12:44:40 +0100
Message-ID: <3aa9531f43ec8e3c499a61d0d61159b0@codethink.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190918104827.GB2596@sirena.co.uk>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2019-09-18 11:48, Mark Brown wrote:
> On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:
> 
>> Why 2? From looking at various codecs that support dsp-a/b modes, it 
>> is
>> more common for the f-sync to be 1 regardless of the number of slots.
> 
> In DSP modes only one edge really matters anyway so it's not super
> important how long the pulse is.

I could never get an answer for why this was set as-is on the customer's
setup and not sure if I have the ability to re-test this.
