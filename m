From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 00/22] Move PMC clocks into Tegra PMC driver
Date: Thu, 5 Mar 2020 00:22:52 +0300
Message-ID: <7722b7b8-82df-c450-a94c-704d15819af0@gmail.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <20200217095940.GE1345979@ulmo>
 <96ed39c9-32d3-98a1-e9d8-ffe63307a556@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <96ed39c9-32d3-98a1-e9d8-ffe63307a556@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.03.2020 22:26, Dmitry Osipenko пишет:
> 17.02.2020 12:59, Thierry Reding пишет:
> ...
>> I've applied patches 1-10 and 13-16 to the Tegra tree, but I think it
>> should be fine for Mark to pick up the ASoC patches into his tree,
>> right?
>>
>> As I mentioned in my reply to patch 20, I think we need to hold off on
>> applying patches 20-22 until all the rest have been merged, otherwise
>> we'll regress.
> 
> Hello Thierry and Sowjanya,
> 
> I was trying today's next-20200304 and found that WiFi / Bluetooth got
> broken:
> 
> [   23.130017] ieee80211 phy0: brcmf_proto_bcdc_query_dcmd:
> brcmf_proto_bcdc_msg failed w/status -110
> [   23.130167] ieee80211 phy0: brcmf_cfg80211_get_channel: chanspec
> failed (-110)
> [   25.690008] ieee80211 phy0: brcmf_proto_bcdc_query_dcmd:
> brcmf_proto_bcdc_msg failed w/status -110
> [   30.811972] ieee80211 phy0: brcmf_dongle_scantime: Scan assoc time
> error (-110)
> [   33.370184] ieee80211 phy0: brcmf_netdev_open: failed to bring up
> cfg80211
> [   35.929994] ieee80211 phy0: brcmf_proto_bcdc_query_dcmd:
> brcmf_proto_bcdc_msg failed w/status -110
> [   35.930181] ieee80211 phy0: brcmf_cfg80211_get_channel: chanspec
> failed (-110)
> 
> The fix is to replace TEGRA30_CLK_BLINK with TEGRA_PMC_CLK_BLINK in a
> device-tree.
> 
> I'm not sure that the TEGRA30_CLK_BLINK breakage is expected to happen
> because all clk/tegra/ PMC code is still in place. Please take a look,
> thanks in advance.

This happens because the unused "pmc_blink" is getting auto-disabled by
the CCF. Which means that it's wrong to apply this series partially.

@Thierry, please re-apply it all properly. All patches, excluding patch
#11, should be applied. Thanks in advance.
