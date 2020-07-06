From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
Date: Mon, 6 Jul 2020 11:04:27 -0600
Message-ID: <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <https://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Peter Geis <pgwipeout@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, linux-tegra@vger.kernel.org, sjg@chromium.org, Dmitry Osipenko <digetx@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 7/3/20 6:32 AM, Peter Geis wrote:
> Good Morning,
> 
> I am attempting to expand on the work for chainloading U-Boot on the
> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> I have so far been unsuccessful at getting any output from U-Boot
> through this method.

I assume that fastboot executes the loaded code on the main CPU not on
the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
the AVP though; you would have to disable SPL to make this all work, and
perhaps fix U-Boot to work without SPL present. I'm not sure what, if
any, changes would be required to support that.

For background, see:
https://http.download.nvidia.com/tegra-public-appnotes/index.html
