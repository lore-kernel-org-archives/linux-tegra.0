From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RESEND PATCH 1/2] ARM: dts: tegra: Add labels to Tegra114 nodes
Date: Tue, 19 May 2015 07:53:05 -0600
Message-ID: <555B4041.5090208@wwwdotorg.org>
References: <1432036279-6318-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432036279-6318-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/19/2015 05:51 AM, Krzysztof Kozlowski wrote:
> Add new labels to certain nodes on Tegra114 so they could be easily
> referenced by board DTS files.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

As I think I mentioned last time, this would make the Tegra114 files 
inconsistent with all other Tegra files. Either we should convert 
everything, or none at all. I'm personally not sure the churn this will 
introduce is worth it, but maybe.
