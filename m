From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] mfd: max77620: Fix FPS switch statements
Date: Wed, 15 Jun 2016 15:11:13 +0900
Message-ID: <CAAVeFuKHEtQyX0YYmbGXLX+JFrEu7qrYmwKZ4tEWzu2qMCLxUw@mail.gmail.com>
References: <1463075104-26924-1-git-send-email-rklein@nvidia.com>
 <20160607080538.GG1525@dell> <8e25e615-e2db-ad9b-2aad-cc44599c58d1@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e25e615-e2db-ad9b-2aad-cc44599c58d1@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 15, 2016 at 1:50 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> On 6/7/2016 4:05 AM, Lee Jones wrote:
>> On Thu, 12 May 2016, Rhyland Klein wrote:
>>
>>> When configuring FPS during probe, assuming a DT node is present for
>>> FPS, the code can run into a problem with the switch statements in
>>> max77620_config_fps() and max77620_get_fps_period_reg_value(). Namely,
>>> in the case of chip->chip_id == MAX77620, it will set
>>> fps_[mix|max]_period but then fall through to the default switch case
>>> and return -EINVAL. Returning this from max77620_config_fps() will
>>> cause probe to fail.
>>>
>>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>>> ---
>>>  drivers/mfd/max77620.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>> Applied to -fixes with Thierry and Laxman's Acks.
>>
>
> I don't see this in linux-next yet (as of 20160614). Can we get this
> merged there to.

Was about to say the same thing. FWIW:

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
