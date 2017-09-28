From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Thu, 28 Sep 2017 09:33:49 +0100
Message-ID: <1748ef0f-3461-75c9-61fe-4cbe1fa66a9a@nvidia.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
 <bee2a524-0891-01e1-4e03-f6cf6a89e6b1@nvidia.com>
 <96bfdacb-3d2d-66b6-70f7-a87664b1afc7@gmail.com>
 <0fd316e9-3584-e9bd-2a8b-e73eaa6a9a48@nvidia.com>
 <20170927233240.GI457@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927233240.GI457@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vinod.koul@intel.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org



On 28/09/17 00:32, Stephen Boyd wrote:
> On 09/27, Jon Hunter wrote:
>>
>>
>> Well, the REQ_SEL should definitely be in the binding.
>>
>> Laxman, Stephen, what are your thoughts on the TRIG_SEL field? Looks
> 
> Wrong Stephen?

Indeed! With all the folks in copy, I assumed we had the right one :-)

Cheers
Jon

-- 
nvpublic
