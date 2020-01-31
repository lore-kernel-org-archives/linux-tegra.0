From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to devm_platform_ioremap_resource
Date: Thu, 30 Jan 2020 17:06:53 -0800
Message-ID: <20200131010654.3336320678@mail.kernel.org>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Eugeniy.Paltsev@synopsys.com, afaerber@suse.de, agross@kernel.org, aisheng.dong@nxp.com, allison@lohutok.net, chunhui.dai@mediatek.com, cw00.choi@samsung.com, daniel.baluta@nxp.com, dinguyen@kernel.org, emilio@elopez.com.ar, festevam@gmail.com, geert+renesas@glider.be, gregkh@linuxfoundation.org, heiko@sntech.de, jcmvbkbc@gmail.com, john@phrozen.org, jonathanh@nvidia.com, kernel@pengutronix.de, kgene@kernel.org, krzk@kernel.org, kstewart@linuxfoundation.org, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, matthias.bgg@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org, mturquette@baylibre.com, nsekhar@ti.com, palmer@sifive.com, paul.walmsley@sifive.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, rfontana@redhat.com, robh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Yangtao Li (2019-12-09 11:57:33)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Please add a cover letter, resend this series picking up any acks and
dropping any patches that were rejected by maintainers of the drivers.
There was significant discussion on one patch that was rejected, so I'll
only pick up patches for the next cycle that are acked/reviewed-by
relevant folks.
