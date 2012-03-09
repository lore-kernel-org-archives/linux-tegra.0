From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 2/2] tegra: Enable pre-console putc() for Tegra
	boards
Date: Fri, 9 Mar 2012 10:24:41 -0800
Message-ID: <CAPnjgZ2CnV8LjOJQx3Y-5fP=+xBPa7eAiikBNnJypDq7r1JLWg@mail.gmail.com>
References: <1331261577-21099-1-git-send-email-sjg@chromium.org>
	<1331261577-21099-2-git-send-email-sjg@chromium.org>
	<4F5A3662.3040009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4F5A3662.3040009@wwwdotorg.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, Tom Warren <twarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Fri, Mar 9, 2012 at 8:57 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 03/08/2012 07:52 PM, Simon Glass wrote:
>> This is used to display panic messages before the console is active.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> I applied both these patches on top of u-boot-tegra/master, built for
> Ventana, and loaded/ran u-boot.bin, and don't see any useful serial
> output; there's a bit of periodic binary spew. u-boot-dtb.bin works as
> expected.

I don't have a ventana but I think Seaboard is equivalent. I will test
on that and figure out what piece is missing.

>
> So, these patches don't appear to solve the problem.

They do in our tree, but I will take a look.

Regards,
Simon
