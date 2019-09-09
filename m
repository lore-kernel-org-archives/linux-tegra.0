From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH net-next v2 1/2] net: stmmac: Only enable enhanced
 addressing mode when needed
Date: Mon, 9 Sep 2019 16:07:04 +0000
Message-ID: <BN8PR12MB3266B232D3B895A4A4368191D3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20190909152546.383-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190909152546.383-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding@gmail.com>
Date: Sep/09/2019, 16:25:45 (UTC+00:00)

> @@ -92,6 +92,7 @@ struct stmmac_dma_cfg {
>  	int fixed_burst;
>  	int mixed_burst;
>  	bool aal;
> +	bool eame;

bools should not be used in struct's, please change to int.

---
Thanks,
Jose Miguel Abreu
