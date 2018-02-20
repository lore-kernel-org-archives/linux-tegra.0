From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: dtc: tegra: enable front panel leds in TrimSlice
Date: Tue, 20 Feb 2018 12:55:04 -0700
Message-ID: <57945bd2-d8c2-f7bc-f01f-29d679762446@wwwdotorg.org>
References: <20180219201623.6987-1-tmn505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219201623.6987-1-tmn505@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Maciej Nowak <tmn505@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 02/19/2018 01:16 PM, Tomasz Maciej Nowak wrote:
> Adds device nodes for two front panel LEDs.

Why do you need to change the pinmux settings? Configuring a pin as a 
GPIO should override any pinmux special function selection and hence 
make it irrelevant, so I don't think you should need to change the pinmux.
