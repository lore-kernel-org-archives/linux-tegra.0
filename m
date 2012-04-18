From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Wed, 18 Apr 2012 14:02:05 -0600
Message-ID: <4F8F1DBD.8000009@wwwdotorg.org>
References: <1333345982-16595-1-git-send-email-alokc@nvidia.com> <20120418142758.GE19220@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120418142758.GE19220@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Alok Chauhan <alokc@nvidia.com>, khali@linux-fr.org, ben-linux@fluff.org, swarren@nvidia.com, olof@lixom.net, bones@secretlab.ca, omaplinuxkernel@gmail.com, ccross@android.com, ldewangan@nvidia.com, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, dgreid@chromium.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/18/2012 08:27 AM, Wolfram Sang wrote:
> On Mon, Apr 02, 2012 at 11:23:02AM +0530, Alok Chauhan wrote:
>> NACK interrupt generated before I2C controller generates
>> the STOP condition on bus. In Software, because of this
>> reset of controller is happening before I2C controller could
>> complete STOP condition. So wait for some time before resetting
>> the controller so that STOP condition has delivered properly on bus.
>>
>> Added delay of 2 clock period before reset the
>> controller in case of NACK error.
>>
>> Signed-off-by: Alok Chauhan <alokc@nvidia.com>
> 
> Applied with Stephen's ACK and slightly reworded comment and commit msg.
> 
> Wondering a bit that you want it for 3.5, not for 3.4. Looks like a
> bugfix to me.

Yes, applying this to 3.4 would make sense. When I said "for 3.5"
earlier, I meant I'd like it to at least get into 3.5 not later.

Thanks.
