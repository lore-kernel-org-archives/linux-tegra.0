From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [PATCH v4 00/23] Add support for Tegra210 Audio
Date: Tue, 30 Jun 2020 17:24:50 +0530
Message-ID: <b44cf9a8-f01b-5c73-5929-d02c4502832e@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <20200630105142.GF5272@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200630105142.GF5272@sirena.org.uk>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: spujar@nvidia.com, perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
List-Id: linux-tegra@vger.kernel.org



On 6/30/2020 4:21 PM, Mark Brown wrote:
> On Sat, Jun 27, 2020 at 10:23:22AM +0530, Sameer Pujar wrote:
>
>> Following is the summary of current series.
>>   * Add YAML DT binding documentation for above mentioned modules.
>>   * Helper function for ACIF programming is exposed for Tegra210 and later.
>>   * Add ASoC driver components for each of the above modules.
>>   * Add DT entries for above components for Tegra210, Tegra186 and
>>     Tegra194.
>>   * Enable these components for Jetson Nano/TX1/TX2/Xavier
>>   * Enhance simple-card DPCM driver to suit Tegra Audio applications with
>>     few changes in core.
>>   * To begin with, enable sound card support for Tegra210 based platforms
>>     like Jetson Nano/TX1.
> This series is too big and covers a few different topics which makes it
> difficult to manage, please split it up.  The most obvious thing here is
> that it contains both the drivers you're adding and a bunch of changes
> to the generic audio cards (which are a single throwaway line in your
> cover letter) - splitting out the generic card changes into a separate
> series would result in more manageable sizes.

My initial thought was, it would be better to present a entire picture 
where complete audio path can be tested or reviewed and hence added 
simple-card patches in the series. I will split this up in next revision.
