From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 12/29] interconnect: Add memory interconnection
 providers for NVIDIA Tegra SoCs
Date: Tue, 19 Nov 2019 19:59:58 +0300
Message-ID: <044b17a8-7186-fec0-e786-5ec5a13e5873@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-13-digetx@gmail.com> <20191119063139.GF2462695@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191119063139.GF2462695@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.11.2019 09:31, Thierry Reding пишет:
> On Mon, Nov 18, 2019 at 11:02:30PM +0300, Dmitry Osipenko wrote:
> [...]
>> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
>> index 1238e35653d1..593954324259 100644
>> --- a/include/soc/tegra/mc.h
>> +++ b/include/soc/tegra/mc.h
>> @@ -141,6 +141,11 @@ struct tegra_mc_reset_ops {
>>  			    const struct tegra_mc_reset *rst);
>>  };
>>  
>> +struct tegra_mc_icc_node {
>> +	const char *name;
>> +	unsigned int id;
>> +};
>> +
>>  struct tegra_mc_soc {
>>  	const struct tegra_mc_client *clients;
>>  	unsigned int num_clients;
>> @@ -160,6 +165,9 @@ struct tegra_mc_soc {
>>  	const struct tegra_mc_reset_ops *reset_ops;
>>  	const struct tegra_mc_reset *resets;
>>  	unsigned int num_resets;
>> +
>> +	const struct tegra_mc_icc_node *icc_nodes;
>> +	unsigned int num_icc_nodes;
>>  };
>>  
>>  struct tegra_mc {
>> @@ -184,4 +192,22 @@ struct tegra_mc {
>>  int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate);
>>  unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc);
>>  
>> +#ifdef CONFIG_INTERCONNECT_TEGRA
>> +int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
>> +int tegra_icc_emc_setup_interconnect(struct device *emc_dev,
>> +				     unsigned int dram_data_bus_width_bytes);
>> +#else
>> +static inline int tegra_icc_mc_setup_interconnect(struct tegra_mc *mc);
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline int
>> +tegra_icc_emc_setup_interconnect(struct device *emc_dev,
>> +				 unsigned int dram_data_bus_width_bytes)
>> +{
>> +	return 0;
>> +}
>> +#endif
> 
> Is there really any reason why we should make this support optional? It
> seems to me like we would always want this enabled once it's tested and
> known to work.

There is always some room for bugs, should be better to have an option
to disable ICC entirely (IMO).
