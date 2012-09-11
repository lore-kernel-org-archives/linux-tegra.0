From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: tegra: move pinconf-tegra.h content into drivers/pinctrl
Date: Tue, 11 Sep 2012 11:12:23 -0600
Message-ID: <504F70F7.9020303@wwwdotorg.org>
References: <1346798370-28795-1-git-send-email-swarren@wwwdotorg.org> <CACRpkdaDQtHvtH-gqps5T5c=EZOzFkMVkg0QbOabzT1zQ1kBdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaDQtHvtH-gqps5T5c=EZOzFkMVkg0QbOabzT1zQ1kBdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 09/05/2012 02:26 AM, Linus Walleij wrote:
> On Wed, Sep 5, 2012 at 12:39 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Now that Tegra's pinmux is configured solely from device tree, there's
>> no need for the pinconf types to be defined in arch/arm/mach-tegra/.
>> Move it into the pinctrl directory to clean up mach-tegra, as a pre-
>> requisite for single-zImage.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>> I'll need to take this through the Tegra tree, since it depends on some
>> patches that remove inclusion of the deleted header.
> 
> Go for it:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Applied to Tegra's for-3.7/cleanup2 branch.
